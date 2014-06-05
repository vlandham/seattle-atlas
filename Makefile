TOPOJSON = node_modules/.bin/topojson

.SECONDARY:

# Download From: http://metro.teczno.com/#seattle
zip/osm/%.zip:
	mkdir -p $(dir $@)
	curl --remote-time 'http://osm-extracted-metros.s3.amazonaws.com/$(notdir $@)' -o $@.download
	mv $@.download $@

zip/data/building-footprints.zip:
	mkdir -p $(dir $@)
	curl "https://data.seattle.gov/api/file_data/u7Zl0GYIIrWvONvtMBxcIkFqI3_mmCHhXagXcGJ30tg" -o $@.download
	mv $@.download $@

shp/osm.shp: zip/osm/seattle.osm2pgsql-shapefiles.zip
	rm -rf $(basename $@)
	mkdir -p $(basename $@)
	tar --exclude="._*" -xzm -C $(basename $@) -f $<
	mv $(basename $@)/* shp
	rm -rf $(basename $@)

shp/building-footprints.shp: zip/data/building-footprints.zip
	mkdir -p $(dir $@)
	unzip -f -d shp $< 'WGS84/*'
	mv shp/WGS84/* shp/
	rm -rf shp/WGS84
	touch $@

shp/%.shp:
	rm -rf $(basename $@)
	mkdir -p $(basename $@)
	tar --exclude="._*" -xzm -C $(basename $@) -f $<

	for file in `find $(basename $@) -name '*.shp'`; do \
		ogr2ogr -dim 2 -f 'ESRI Shapefile' -t_srs EPSG:4326 $(basename $@).$${file##*.} $$file; \
		chmod 644 $(basename $@).$${file##*.}; \
	done
	rm -rf $(basename $@)



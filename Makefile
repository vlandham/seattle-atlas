TOPOJSON = node_modules/.bin/topojson

shps: shp/osm.shp \
	shp/footprints.shp \
	shp/neighborhoods.shp

.SECONDARY:

# Download From: http://metro.teczno.com/#seattle
zip/osm/%.zip:
	mkdir -p $(dir $@)
	curl --remote-time 'http://osm-extracted-metros.s3.amazonaws.com/$(notdir $@)' -o $@.download
	mv $@.download $@

zip/data/buildings.zip:
	mkdir -p $(dir $@)
	curl "https://data.seattle.gov/api/file_data/u7Zl0GYIIrWvONvtMBxcIkFqI3_mmCHhXagXcGJ30tg" -o $@.download
	mv $@.download $@

zip/data/footprints-1999.zip:
	mkdir -p $(dir $@)
	curl "https://data.seattle.gov/api/file_data/fE-eWRCPTo4R35GLxbM07ECh-WTo7ucAV7ottdaVUiQ" -o $@.download
	mv $@.download $@

zip/data/neighborhoods.zip:
	mkdir -p $(dir $@)
	curl "https://data.seattle.gov/api/file_data/WsWJokbkl9a8T9e85amDs38Y-P9ek-yuCfhlwJg20KQ" -o $@.download
	mv $@.download $@

zip/data/parks.zip:
	mkdir -p $(dir $@)
	curl "https://data.seattle.gov/api/file_data/s5n0vsEbUsdzOgCGedpAqBvmIrC7QSrD_3696r9o0ZY" -o $@.download
	mv $@.download $@

zip/data/zoning.zip:
	mkdir -p $(dir $@)
	curl "https://data.seattle.gov/api/file_data/j7Y3Stsi0JQOmS3ZLT9bbRWud8vY560FHT0tDpChHlg" -o $@.download
	mv $@.download $@

zip/data/trees.zip:
	mkdir -p $(dir $@)
	curl "https://data.seattle.gov/api/file_data/KE9iik5hPNBiu0RMAEfL2aVRXbcGZW-ecSrKihhArTs" -o $@.download
	mv $@.download $@
	
zip/data/shorelines.zip:
	mkdir -p $(dir $@)
	curl "https://data.seattle.gov/api/file_data/MulEsQl5gHuxU_f1ilgWRhDr1zbUTN-_skTIzUHs6xM" -o $@.download
	mv $@.download $@

zip/data/streams.zip:
	mkdir -p $(dir $@)
	curl "https://data.seattle.gov/api/file_data/_hyoYTVi2kDL9jjZaPpUdgOiiRqVVgJgF-yNuwYjuq8" -o $@.download
	mv $@.download $@

zip/streets/streets.zip:
	mkdir -p $(dir $@)
	curl "https://data.seattle.gov/api/file_data/PEJgzGG01F_8_a3gFDJkkUIt0NoG0Zx5hR7fOAzz-Ik" -o $@.download
	mv $@.download $@

zip/transit/transit.zip:
	mkdir -p $(dir $@)
	curl "http://metro.kingcounty.gov/GTFS/google_transit.zip" -o $@.download
	mv $@.download $@

shp/osm.shp: zip/osm/seattle.osm2pgsql-shapefiles.zip
	rm -rf $(basename $@)
	mkdir -p $(basename $@)
	tar --exclude="._*" -xzm -C $(basename $@) -f $<
	mv $(basename $@)/* shp
	rm -rf $(basename $@)

zip/unzip/%: zip/data/%.zip
	mkdir -p $(dir $@)
	unzip -o -d shp $< '**WGS84/*'

zip/unzip/%: zip/streets/%.zip
	mkdir -p $(dir $@)
	unzip -o -d shp $< '**/WGS84/*'
	mv shp/**/WGS84 shp/WGS84

shp/%.shp: zip/unzip/%
	bin/remove_spaces.sh shp/WGS84
	for file in `find shp/WGS84 -name '*.shp'`; do \
		ogr2ogr -dim 2 -f 'ESRI Shapefile' -t_srs EPSG:4326 $(basename $@).$${file##*.} $$file; \
		chmod 644 $(basename $@).$${file##*.}; \
	done
	rm -rf shp/WGS84

out/%.png: shp/%.shp bin/rasterize.js
	mkdir -p $(dir $@)
	node --max_old_space_size=8192 bin/rasterize.js $< $@
	pngnq -f -n 256 -s 10 -Q f -e ".png" $@

# shp/%.shp:
# 	rm -rf $(basename $@)
# 	mkdir -p $(basename $@)
# 	tar --exclude="._*" -xzm -C $(basename $@) -f $<
# 
# 	for file in `find $(basename $@) -name '*.shp'`; do \
# 		ogr2ogr -dim 2 -f 'ESRI Shapefile' -t_srs EPSG:4326 $(basename $@).$${file##*.} $$file; \
# 		chmod 644 $(basename $@).$${file##*.}; \
# 	done
# 	rm -rf $(basename $@)
# 


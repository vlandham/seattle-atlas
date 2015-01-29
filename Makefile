TOPOJSON = node_modules/.bin/topojson
CSV2GEO = node_modules/.bin/csv2geojson

shps: shp/osm.shp \
	shp/footprints-1999.shp \
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

zip/data/addresses.zip:
	mkdir -p $(dir $@)
	curl "https://data.seattle.gov/api/file_data/CWjeD1zuxggmFFRt34zlSc-PJxb7KRahRQwjrQiJTBw" -o $@.download
	mv $@.download $@

zip/footprints/footprints-1999.zip:
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

zip/data/urban-villages.zip:
	mkdir -p $(dir $@)
	curl "https://data.seattle.gov/api/file_data/p22YgePthVgtok55zqkHbtirq05z9PpOMY1P7ARoJ0I" -o $@.download
	mv $@.download $@

zip/streets/streets.zip:
	mkdir -p $(dir $@)
	curl "https://data.seattle.gov/api/file_data/PEJgzGG01F_8_a3gFDJkkUIt0NoG0Zx5hR7fOAzz-Ik" -o $@.download
	mv $@.download $@

zip/census/tracts.zip:
	mkdir -p $(dir $@)
	curl "http://www2.census.gov/geo/tiger/TIGER2013/TRACT/tl_2013_53_tract.zip" -o $@.download
	mv $@.download $@

zip/census/school-districts.zip:
	mkdir -p $(dir $@)
	curl "http://www2.census.gov/geo/tiger/TIGER2013/UNSD/tl_2013_53_unsd.zip" -o $@.download
	mv $@.download $@

zip/census/block-groups.zip:
	mkdir -p $(dir $@)
	curl "http://www2.census.gov/geo/tiger/TIGER2013/BG/tl_2013_53_bg.zip" -o $@.download
	mv $@.download $@

zip/transit/ferry-routes.zip:
	mkdir -p $(dir $@)
	curl "ftp://ftp.wsdot.wa.gov/gis/GeoDataDistribution/Maps/24k/DOT_Cartog/ferry.zip" -o $@.download
	mv $@.download $@

zip/transit/ferry-terminals.zip:
	mkdir -p $(dir $@)
	curl "ftp://ftp.wsdot.wa.gov/gis/GeoDataDistribution/Maps/24k/DOT_Cartog/ferrytermspubpriv.zip" -o $@.download
	mv $@.download $@

zip/transit/transit.zip:
	mkdir -p $(dir $@)
	curl "http://metro.kingcounty.gov/GTFS/google_transit.zip" -o $@.download
	mv $@.download $@

zip/beach-access.zip:
	mkdir -p $(dir $@)
	curl "ftp://ecy.wa.gov/gis_a/shore/Public_Access_WA_SHP.zip" -o $@.download
	mv $@.download $@

zip/costal-zone-atlas.zip:
	mkdir -p $(dir $@)
	curl "ftp://www.ecy.wa.gov/gis_a/geoscientificinformation/slopestab.zip" -o $@.download
	mv $@.download $@

zip/tribal-lands.zip:
	mkdir -p $(dir $@)
	curl "ftp://www.ecy.wa.gov/gis_a/boundaries/tribal.zip" -o $@.download
	mv $@.download $@

zip/geo-names.zip:
	mkdir -p $(dir $@)
	curl "ftp://www.ecy.wa.gov/gis_a/location/gnis.zip" -o $@.download
	mv $@.download $@

csv/starbucks.csv:
	mkdir -p $(dir $@)
	curl "https://opendata.socrata.com/api/views/ddym-zvjk/rows.csv?accessType=DOWNLOAD" -o $@.download
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

zip/unzip/%: zip/footprints/%.zip
	mkdir -p $(dir $@)
	unzip -o -d shp $< '**/WGS84/*'
	mv shp/**/WGS84 shp/WGS84

zip/unzip/%: zip/census/%.zip
	mkdir -p $(dir $@)
	mkdir -p shp/WGS84
	unzip -o -d shp/WGS84 $<

zip/unzip/%: zip/transit/%.zip
	mkdir -p $(dir $@)
	mkdir -p shp/WGS84
	unzip -o -d shp/WGS84 $<

zip/unzip/%: zip/%.zip
	mkdir -p $(dir $@)
	mkdir -p shp/WGS84
	unzip -o -d shp/WGS84 $<

shp/%.shp: zip/unzip/%
	bin/remove_spaces.sh shp/WGS84
	for file in `find shp/WGS84 -name '*.shp'`; do \
		ogr2ogr -dim 2 -f 'ESRI Shapefile' -t_srs EPSG:4326 $(basename $@).$${file##*.} $$file; \
		chmod 644 $(basename $@).$${file##*.}; \
	done
	rm -rf shp/WGS84

geo/starbucks.json: csv/starbucks.csv
	mkdir -p $(dir $@)
	$(CSV2GEO) -lat 'Latitude' -lon 'Longitude' $< > $@

geo/%.json: shp/%.shp
	mkdir -p $(dir $@)
	ogr2ogr -f geoJSON $(basename $@).json $<


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


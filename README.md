# Seattle Atlas

Provides convenient method to download Seattle related shapefiles and convert some of them to TopoJSON format.

Inspired by Bostock's [world-atlas](https://github.com/mbostock/world-atlas). 

Idea copied from and based on Justin Palmer's [portland-atlas](https://github.com/Caged/portland-atlas).

## Prerequisites

Before you can run `make`, you’ll need to install `Node` and `ogr2ogr`. If you are on Mac OS X, and using [Homebrew](http://mxcl.github.com/homebrew/) then just run:

```bash
brew install node 
brew install gdal
```

And then, from this repository’s root directory, install the dependencies:

```bash
npm install
```

## Make Targets

... | ... | ... 
:---: | :---: | :---: 
![](https://raw.githubusercontent.com/vlandham/seattle-atlas/master/out/neighborhoods.png) **Neighborhoods** | ![](https://raw.githubusercontent.com/vlandham/seattle-atlas/master/out/buildings.png) **Building Footprints** | ![](https://raw.githubusercontent.com/vlandham/seattle-atlas/master/out/streets.png) **Streets**  
![](https://raw.githubusercontent.com/vlandham/seattle-atlas/master/out/parks.png) **Parks** | ![](https://raw.githubusercontent.com/vlandham/seattle-atlas/master/out/zoning.png) **Zoning** | ![](https://raw.githubusercontent.com/vlandham/seattle-atlas/master/out/trees.png) **Trees**  
![](https://raw.githubusercontent.com/vlandham/seattle-atlas/master/out/shorelines.png) **Shorelines** | ![](https://raw.githubusercontent.com/vlandham/seattle-atlas/master/out/streams.png) **Streams** | ![](https://raw.githubusercontent.com/vlandham/seattle-atlas/master/out/addresses.png) **Addresses**  
![](https://raw.githubusercontent.com/vlandham/seattle-atlas/master/out/tracts.png) **Census Tracts** | ![](https://raw.githubusercontent.com/vlandham/seattle-atlas/master/out/school-districts.png) **School Districts** | ![](https://raw.githubusercontent.com/vlandham/seattle-atlas/master/out/block-groups.png) **Block Groups**  
![](https://raw.githubusercontent.com/vlandham/seattle-atlas/master/out/beach-access.png) **Beach Access** | ![](https://raw.githubusercontent.com/vlandham/seattle-atlas/master/out/geo-names.png) **Geo Names** | ![](https://raw.githubusercontent.com/vlandham/seattle-atlas/master/out/tribal-lands.png) **Tribal Lands**  

All Make Targets can be run using make. Example:

```bash
make shp/buildings.shp
```

### Shapefiles

<b>shp/osm.shp</b>

Shapefiles from [Metro Extracts](http://metro.teczno.com/#seattle).

<b>shp/buildings.shp</b>

2009 building footprints from [Data Portal](https://data.seattle.gov/dataset/2009-Building-Outlines/y7u8-vad7)

<b>shp/neighborhoods.shp</b>

Neighborhood outlines from [Data Portal]()

<b>shp/streets.shp</b>

Street Network data from [Data Portal](https://data.seattle.gov/dataset/Street-Network-Database/afip-2mzr)

<b>shp/parks.shp</b>

Parks from [Data Portal](https://data.seattle.gov/dataset/City-Of-Seattle-Parks/kxj9-se6t)

<b>shp/zoning.shp</b>

Zoning from [Data Portal](https://https://data.seattle.gov/dataset/City-Of-Seattle-Zoning/2hat-teay)

<b>shp/trees.shp</b>

Tree locations from [Data Portal](https://data.seattle.gov/dataset/Trees/xg4t-j322)

<b>shp/shorelines.shp</b>

Shoreline data from [Data Portal](https://data.seattle.gov/dataset/Shorelines/gf6u-sgut)

<b>shp/streams.shp</b>

stream data from [Data Portal](https://data.seattle.gov/dataset/Streams/fwb4-f3gx)

<b>shp/urban-villages.shp</b>

from [Data Portal](https://data.seattle.gov/dataset/Urban-Villages/ugw3-tp9e)

<b>shp/tracts.shp</b>

Census Tracts for Washington - from [Census](http://www.census.gov/cgi-bin/geo/shapefiles2013/main)

<b>shp/beach-access.shp</b>

Beach Access Sites from [WA Ecology Dept](https://fortress.wa.gov/ecy/coastalatlas/tools/PublicAccessDownload.aspx)

<b>shp/geo-names.shp</b>

Geographic Names Information System from [WA Ecology Dept](http://www.ecy.wa.gov/services/gis/data/data.htm)

### TopoJSON

## Other GIS Sources

Here are some other links for GIS / Shapefile data for Washington / Seattle:


  * [WA department of Natural Resources](http://fortress.wa.gov/dnr/app1/dataweb/dmmatrix.html)
  * [King County GIS Data](http://www.kingcounty.gov/operations/GIS/GISData/Metadata.aspx)
  * [WAGDA from UW](http://wagda.lib.washington.edu/data/)
  * [WA department of Transportation](http://www.wsdot.wa.gov/mapsdata/geodatacatalog/default.htm)
  * [WA department of Ecology](http://www.ecy.wa.gov/services/gis/data/data.htm)


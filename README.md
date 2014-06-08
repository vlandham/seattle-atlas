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
![](https://raw.githubusercontent.com/vlandham/seattle-atlas/master/out/neighborhoods.png) **Neighborhoods** | ![](https://raw.githubusercontent.com/vlandham/seattle-atlas/master/out/buildings.png) **Building Footprints** | ![](https://raw.githubusercontent.com/vlandham/seattle-atlas/master/out/steets.png) **Streets**  
![](https://raw.githubusercontent.com/vlandham/seattle-atlas/master/out/parks.png) **Parks** | ![](https://raw.githubusercontent.com/vlandham/seattle-atlas/master/out/zoning.png) **Zoning** | ![](https://raw.githubusercontent.com/vlandham/seattle-atlas/master/out/trees.png) **Trees**  
![](https://raw.githubusercontent.com/vlandham/seattle-atlas/master/out/shorelines.png) **Shorelines** | ![](https://raw.githubusercontent.com/vlandham/seattle-atlas/master/out/zoning.png) **Zoning** | ![](https://raw.githubusercontent.com/vlandham/seattle-atlas/master/out/trees.png) **Trees**  

## Shapefiles

<b>shp/osm.shp</b>

Shapefiles from [Metro Extracts](http://metro.teczno.com/#seattle).

<b>shp/buildings.shp</b>

2009 building footprints from [Data Portal](https://data.seattle.gov/dataset/2009-Building-Outlines/y7u8-vad7)

<b>shp/neighborhoods.shp</b>

Neighborhood outlines from [Data Portal]()

<b>shp/streets.shp</b>

Steet Network data from [Data Portal](https://data.seattle.gov/dataset/Street-Network-Database/afip-2mzr)

<b>shp/parks.shp</b>

Parks from [Data Portal](https://data.seattle.gov/dataset/City-Of-Seattle-Parks/kxj9-se6t)

<b>shp/zoning.shp</b>

Zoning from [Data Portal](https://https://data.seattle.gov/dataset/City-Of-Seattle-Zoning/2hat-teay)

<b>shp/trees.shp</b>

Tree locations from [Data Portal](https://data.seattle.gov/dataset/Trees/xg4t-j322)

<b>shp/shorelines.shp</b>

Shoreline data from [Data Portal](https://data.seattle.gov/dataset/Shorelines/gf6u-sgut)

## TopoJSON

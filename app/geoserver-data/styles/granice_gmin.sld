<?xml version="1.0" encoding="ISO-8859-1"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.0.0" xmlns:xlink="http://www.w3.org/1999/xlink" xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd">
 <NamedLayer>
  <Name>OWDP_UTF8</Name>
  <UserStyle>
   <Title>OWDP_UTF8</Title>
   <FeatureTypeStyle>
    <Rule>
     <PolygonSymbolizer>
      <Fill>
       <CssParameter name="fill">#ffff7f</CssParameter>
       <CssParameter name="fill-opacity">0</CssParameter>
      </Fill>
      <Stroke>
       <CssParameter name="stroke">#000000</CssParameter>
       <CssParameter name="stroke-width">0.26</CssParameter>
      </Stroke>
     </PolygonSymbolizer>
    </Rule>
   </FeatureTypeStyle>
   <FeatureTypeStyle>
    <Rule>
     <TextSymbolizer>
      <Label>
       <ogc:PropertyName>NAZWA</ogc:PropertyName>
      </Label>
      <Font>
       <CssParameter name="font-family">MS Shell Dlg 2</CssParameter>
       <CssParameter name="font-size">16.0</CssParameter>
       <CssParameter name="font-style">normal</CssParameter>
       <CssParameter name="font-weight">boldl</CssParameter>
      </Font>
     </TextSymbolizer>
    </Rule>
   </FeatureTypeStyle>
  </UserStyle>
 </NamedLayer>
</StyledLayerDescriptor>
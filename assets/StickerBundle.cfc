/**
 * Sticker bundle configuration file. See: http://sticker.readthedocs.org/
 */
component {

	public void function configure( bundle ) {
		bundle.addAssets(
			  directory   = "/"
			, match       = function( filepath ){ return ReFindNoCase( "\.(js|css)$", filepath ); }
			, idGenerator = function( filepath ){
				var fileName = ListLast( filePath, "/" );
				var id       = ListLast( filename, "." ) & "-" & ReReplace( filename, "\.(js|css)$", "" );
				return id;
			  }
		);

		// bundle.asset( "css-bootstrap" ).before( "*" );
		// bundle.asset( "js-bootstrap" ).dependsOn( "js-jquery" );

		bundle.addAsset( id="bootstrap-css", url="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" );

		bundle.addAsset( id="fontawesome-js", url="https://kit.fontawesome.com/ace4ced280.js" );
	}

}
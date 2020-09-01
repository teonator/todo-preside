<cfscript>
	body     = renderView();
	// mainNav  = renderViewlet( "core.navigation.mainNavigation" );
	metaTags = renderView( "/general/_pageMetaForHtmlHead" );
	// adminBar = renderView( "/general/_adminToolbar"        );

	event
		.include( "bootstrap-css" )
		.include( "css-todo" )
		.include( "fontawesome-js" )
	;
	//      .include( "css-layout"    )
	//      .include( "js-bootstrap"  )
	//      .include( "js-jquery"     );
</cfscript>

<cfoutput><!doctype html>
<html lang="en">
	<head>
		#metaTags#

		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

		#event.renderIncludes( "css" )#
	</head>
	<body>
		<div class="container mt-5 mb-5">
			#body#
		</div>

		#event.renderIncludes( "js" )#
	</body>
</html></cfoutput>
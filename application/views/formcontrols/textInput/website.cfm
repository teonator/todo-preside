<cfscript>
	inputName    = args.name         ?: "";
	inputId      = args.id           ?: "";
	inputClass   = args.class        ?: "";
	defaultValue = args.defaultValue ?: "";
	maxlength    = args.maxlength    ?: "";
	minlength    = args.minlength    ?: "";
	placeholder  = args.placeholder  ?: "";

	placeholder  = htmlEditFormat( translateResource( uri=placeholder, defaultValue=placeholder ) );

	hasError = len( trim( args.error ) );

	value  = event.getValue( name=inputName, defaultValue=defaultValue );
	if ( not IsSimpleValue( value ) ) {
		value = "";
	}

	value = htmlEditFormat( value );
</cfscript>

<cfoutput>
	<input type="text" id="#inputId#" placeholder="#placeholder#" name="#inputName#" value="#value#" class="#inputClass# form-control<cfif hasError> is-invalid</cfif>" tabindex="#getNextTabIndex()#"<cfif isNumeric( maxlength ) and maxlength gt 0> maxlength="#maxlength#"</cfif> <cfif isNumeric( minlength ) and minlength gt 0> minlength="#minlength#"</cfif>>
</cfoutput>
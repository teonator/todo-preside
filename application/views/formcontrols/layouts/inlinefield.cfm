<cfscript>
	param name="args.control"  type="string";
	param name="args.label"    type="string";
	param name="args.help"     type="string";
	param name="args.for"      type="string";
	param name="args.error"    type="string";
	param name="args.required" type="boolean";

	hasError = len( trim( args.error ) );
</cfscript>

<cfoutput>
	<label class="sr-only" for="#args.for#">
		#args.label#
		<cfif args.required>
			<sup><i class="fas fa-asterisk"></i></sup>
		</cfif>
	</label>
	#args.control#
	<cfif hasError>
		<div class="invalid-feedback">
			#args.error#
		</div>
	</cfif>
	<cfif len( trim( args.help ) )>
		<small class="form-text text-muted">
			#htmlEditFormat( args.help )#
		</small>
	</cfif>
</cfoutput>
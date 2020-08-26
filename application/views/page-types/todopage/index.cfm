<cfparam name="args.title"        type="string" field="page.title"        editable="true" />
<cfparam name="args.main_content" type="string" field="page.main_content" editable="true" />

<cfscript>
	var formName    = args.formName    ?: "";
	var formId      = args.formId      ?: "";
	var formStatus  = args.formStatus  ?: "";
	var formMessage = args.formMessage ?: "";

	var validationResult = args.validationResult ?: "";
	var savedData        = args.savedData        ?: {};
	var additionalArgs   = args.additionalArgs   ?: {};
</cfscript>

<cfoutput>
	<h1>#args.title#</h1>

	#args.main_content#

	<br />

	<cfif len( formStatus )>
		<div class="alert alert-#formStatus#">
			#formMessage#
		</div>
	</cfif>

	<h4>New</h4>
	<hr />
	<form id="#formId#" name="#formName#" action="#event.buildLink( linkTo="page-types.todopage.save" )#" method="POST">
		#renderForm(
			  formName         = formName
			, formId           = formId
			, context          = "website"
			, validationResult = validationResult
			, savedData        = savedData
			, additionalArgs   = additionalArgs
		)#
	</form>

	<h4>Todo</h4>
	<hr />
	#renderViewlet( event="page-types.todopage._tasks", args={ status=false } )#

	<h4>Done</h4>
	<hr />
	#renderViewlet( event="page-types.todopage._tasks", args={ status=true } )#
</cfoutput>
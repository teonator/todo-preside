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

	<div class="mb-3">#args.main_content#</div>

	<cfif len( formStatus )>
		<div class="alert alert-#formStatus#">
			#formMessage#
		</div>
	</cfif>

	<form id="#formId#" name="#formName#" action="#event.buildLink( linkTo="page-types.todopage.save" )#" method="POST" class="mt-3 mb-4">
		<div class="d-flex align-items-center">
			<div class="flex-grow-1 pr-3">
				#renderForm(
					  formName         = formName
					, formId           = formId
					, context          = "website"
					, fieldLayout      = "formcontrols.layouts.inlinefield"
					, validationResult = validationResult
					, savedData        = savedData
					, additionalArgs   = additionalArgs
				)#
			</div>

			<button type="submit" class="btn btn-primary">
				<i class="fas fa-plus"></i>
			</button>
		</div>
	</form>

	<div class="row">
		<div class="col col-sm-6">
			<h4>Pending</h4>
			#renderViewlet( event="page-types.todopage._tasks", args={ status=false } )#
		</div>
		<div class="col col-sm-6">
			<h4>Done</h4>
			#renderViewlet( event="page-types.todopage._tasks", args={ status=true } )#
		</div>
	</div>
</cfoutput>
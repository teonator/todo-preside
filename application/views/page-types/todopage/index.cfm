<cfparam name="args.title"        type="string" field="page.title"        editable="true" />
<cfparam name="args.main_content" type="string" field="page.main_content" editable="true" />

<cfoutput>
	<h1>#args.title#</h1>

	<div class="mb-3">#args.main_content#</div>

	<form id="#args.formId#" name="#args.formName#" action="#event.buildLink( linkTo="page-types.todopage.add" )#" method="POST" class="mt-3 mb-4">
		<div class="d-flex align-items-start">
			<div class="flex-grow-1 pr-3">
				#renderForm(
					  formName            = args.formName
					, formId              = args.formId
					, context             = "website"
					, fieldLayout         = "formcontrols.layouts.inlinefield"
					, validationResult    = args.validationResult
					, includeValidationJs = false
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
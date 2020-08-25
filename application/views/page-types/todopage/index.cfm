<cfparam name="args.title"        type="string" field="page.title"        editable="true" />
<cfparam name="args.main_content" type="string" field="page.main_content" editable="true" />

<cfscript>
	var formName = "todo_form";
	var formId = "todo-form";

	var validationResult = args.validationResult ?: "";
	var savedData        = args.savedData        ?: {};
	var additionalArgs   = args.additionalArgs   ?: {};
</cfscript>

<cfoutput>
	<h1>#args.title#</h1>

	#args.main_content#

	<br />

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
component {
	property name="taskService" inject="TaskService";

	variables.formName = "todo_form";
	variables.formId   = "todo-form";

	public function preHandler( event, rc, prc, action, eventArguments ) {
		if( structKeyExists( arguments.eventArguments, "args" ) ) {
			structAppend( arguments.eventArguments.args, {
				  formName    = variables.formName
				, formId      = variables.formId
				, formStatus  = ""
				, formMessage = ""
			} )
		}
	}

	public function index( event, rc, prc, args={} ) {
		args.formData       = rc.formData       ?: {};
		args.additionalArgs = rc.additionalArgs       ?: {};

		return renderView(
			  view          = 'page-types/todopage/index'
			, presideObject = 'todopage'
			, id            = event.getCurrentPageId()
			, args          = arguments.args
		);
	}

	private function _tasks( event, rc, prc, args={} ) {
		var status = args.status ?: false;

		args.tasks  = taskService.getTasks( status=status );
		args.status = status;

		return renderView( view='page-types/todopage/_tasks', args=args );
	}

	public function save( event, rc, prc, args={} ) {
		var formName         = rc.$presideform;
		var formData         = event.getCollectionForForm( formName=formName );

		var validationResult = validateForm( formName=formName, formData=formData );

		if ( validationResult.validated() ) {
			taskService.addTask( label=formData.label );

			formStatus = "success";
			formMessage = "Aww yeah! New task has successfully created.";
		}
		else {
			formStatus = "danger";
			formMessage = "Whoops! There were some problems with your input.";
		}

		relocate(
			  url           = event.buildLink( page="todopage" )
			, persistStruct = {
				  validationResult = validationResult
				, savedData        = formData
				, formStatus       = formStatus
				, formMessage      = formMessage
			}
		);
	}
}
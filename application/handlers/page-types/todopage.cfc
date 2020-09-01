component {
	property name="taskService" inject="TaskService";

	variables.formName = "todo_form";
	variables.formId   = "todo-form";

	public function preHandler( event, rc, prc, action, eventArguments ) {
		if( structKeyExists( arguments.eventArguments, "args" ) ) {
			structAppend( arguments.eventArguments.args, {
				  formName    = variables.formName
				, formId      = variables.formId
				, formData    = {}
				, formStatus  = ""
				, formMessage = ""
			} )
		}
	}

	public function index( event, rc, prc, args={} ) {
		args.formData    = rc.formData    ?: {};
		args.formStatus  = rc.formStatus  ?: "";
		args.formMessage = rc.formMessage ?: "";

		args.additionalArgs = rc.additionalArgs ?: {};

		return renderView(
			  view          = 'page-types/todopage/index'
			, presideObject = 'todopage'
			, id            = event.getCurrentPageId()
			, args          = args
		);
	}

	public function add( event, rc, prc, args={} ) {
		var formName         = variables.formName;
		var formData         = event.getCollectionForForm( formName=variables.formName );

		var validationResult = validateForm( formName=formName, formData=formData );

		if ( validationResult.validated() ) {
			taskService.addTask( label=formData.label );

			formStatus = "success";
			formMessage = "Aww yeah! New task has successfully created.";
		}
		else {
			formStatus = "warning";
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

	public function edit( event, rc, prc, args={} ) {
		var id = rc.id ?: "";

		taskService.editTask( id=id, status=true );

		relocate(
			  url           = event.buildLink( page="todopage" )
			, persistStruct = {
				  formStatus  = "success"
				, formMessage = "Aww yeah! The task has successfully updated."
			}
		);
	}

	public function delete( event, rc, prc, args={} ) {
		var id = rc.id ?: "";

		taskService.deleteTask( id=id );

		relocate(
			  url           = event.buildLink( page="todopage" )
			, persistStruct = {
				  formStatus  = "danger"
				, formMessage = "Aww yeah! The task has successfully deleted."
			}
		);
	}

	private function _tasks( event, rc, prc, args={} ) {
		var status = args.status ?: false;

		args.tasks  = taskService.getTasks( status=status );
		args.status = status;

		return renderView( view='page-types/todopage/_tasks', args=args );
	}
}
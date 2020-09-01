component {
	property name="taskService" inject="TaskService";

	variables.formName = "todo_form";
	variables.formId   = "todo-form";

	public function preHandler( event, rc, prc, action, eventArguments ) {
		if( structKeyExists( arguments.eventArguments, "args" ) ) {
			structAppend( arguments.eventArguments.args, {
				  formName         = variables.formName
				, formId           = variables.formId
				, formData         = {}
				, validationResult = getSingleton( "validationEngine" ).newValidationResult()
			} )
		}
	}

	public function index( event, rc, prc, args={} ) {
		arguments.args.formData    = arguments.rc.formData    ?: {};
		arguments.args.validationResult = arguments.rc.validationResult ?: "";

		return renderView(
			  view          = 'page-types/todopage/index'
			, presideObject = 'todopage'
			, id            = arguments.event.getCurrentPageId()
			, args          = arguments.args
		);
	}

	public function add( event, rc, prc, args={} ) {
		var formName         = variables.formName;
		var formData         = arguments.event.getCollectionForForm( formName=variables.formName );

		var validationResult = validateForm( formName=formName, formData=formData );

		if ( validationResult.validated() ) {
			taskService.addTask( label=formData.label );
		}

		relocate(
			  url           = arguments.event.buildLink( page="todopage" )
			, persistStruct = {
				  validationResult = validationResult
				, savedData        = formData
			}
		);
	}

	public function edit( event, rc, prc, args={} ) {
		var id = arguments.rc.id ?: "";

        taskService.editTask( id=id, status=true );

		relocate( url = arguments.event.buildLink( page="todopage" ) );
	}

	public function delete( event, rc, prc, args={} ) {
		var id = arguments.rc.id ?: "";

		taskService.deleteTask( id=id );

		relocate( url = arguments.event.buildLink( page="todopage" ) );
	}

	private function _tasks( event, rc, prc, args={} ) {
		var status = arguments.args.status ?: false;

		arguments.args.tasks  = taskService.getTasks( status=status );
		arguments.args.status = status;

		return renderView( view='page-types/todopage/_tasks', args=arguments.args );
	}
}
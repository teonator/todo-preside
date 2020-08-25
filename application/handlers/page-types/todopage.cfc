component {
	property name="taskService" inject="TaskService";

	private function _tasks( event, rc, prc, args={} ) {
		var status = args.status ?: false;

		args.tasks = taskService.getTasks( status=status );

		return renderView( view='page-types/todopage/_tasks', args=args );
	}
}
/**
 * @presideService true
 * @singleton      true
 */
 component{
	public any function init() {
		return this;
	}

	public query function getTasks( boolean status=false ) {
		var query = $getPresideObject('task').selectData(
			  selectFields = [
				  "id"
				, "label"
				, "status"
				, "datecreated"
			]
			, filter       = "status = :status"
			, filterParams = {
				"status" = { type="boolean", value=arguments.status }
			}
			, orderBy      = "datecreated ASC"
		);

		return query ?: queryNew( "" );
	}

	public string function addTask( required string label ) {
		var id = $getPresideObject('task').insertData(
			data = {
				  label = arguments.label
				, status = false
			}
		);

		return id ?: "";
	}

	public string function editTask( required string id, required boolean status ) {
		$getPresideObject('task').updateData(
			  id   = arguments.id
			, data = {
				status = arguments.status
			}
		);

		return arguments.id;
	}

	public string function deleteTask( required string id, boolean status=true  ) {
		$getPresideObject('task').deleteData(
			  id           = arguments.id
			, filter       = "status = :status"
			, filterParams = {
				"status" = { type="boolean", value=arguments.status }
			}
		);

		return arguments.id;
	}
}
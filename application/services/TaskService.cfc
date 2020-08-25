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
				  "label"
				, "status"
			]
			, filter       = "status = :status"
			, filterParams = {
				"status" = { type="boolean", value=arguments.status }
			}
			, orderBy      = "datecreated ASC"
		);

		return query ?: queryNew( "" );
	}
}
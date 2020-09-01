<cfoutput>
	<cfif args.tasks.recordCount>
	<ul class="list-group mb-3">
		<cfloop query="args.tasks">
			<li class="list-group-item list-group-item-action d-flex align-items-center">
				<div class="flex-grow-1">
					<p class="m-0">#( args.status? "<s>#label#</s>": "<mark>#label#</mark>" )#</p>
					<small class="text-muted">#dateTimeFormat( datecreated, "d mmm yyyy, h:nntt" )#</small>
				</div>

				<cfif args.status>
					<a class="btn btn-sm btn-outline-danger" href="#event.buildLink( linkTo="page-types.todopage.delete", queryString="id=#id#" )#">
						<i class="fas fa-times"></i>
					</a>
				<cfelse>
					<a class="btn btn-sm btn-outline-success" href="#event.buildLink( linkTo="page-types.todopage.edit", queryString="id=#id#" )#">
						<i class="fas fa-check"></i>
					</a>
				</cfif>
			</li>
		</cfloop>
	</ul>
	<cfelse>
		<cfif args.status>
			<p class="text-danger">
				No done tasks.
			</p>
		<cfelse>
			<p class="text-success">
	  			No pending tasks.
			</p>
		</cfif>
	</cfif>
</cfoutput>
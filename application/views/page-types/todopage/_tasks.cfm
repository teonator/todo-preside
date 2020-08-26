<cfoutput>
	<ul class="list-group mb-3">
		<cfloop query="args.tasks">
			<li class="list-group-item list-group-item-action d-flex align-items-center">
				<div class="flex-grow-1">
					<p class="m-0">#( args.status? "<s>#label#</s>": "<mark>#label#</mark>" )#</p>
					<small class="text-muted">#dateTimeFormat( datecreated, "d mmm yyyy, h:nntt" )#</small>
				</div>

				<cfif args.status>
					<a class="btn btn-sm btn-outline-danger" href="##">
						<i class="fas fa-times"></i>
					</a>
				<cfelse>
					<a class="btn btn-sm btn-outline-success" href="##">
						<i class="fas fa-check"></i>
					</a>
				</cfif>
			</li>
		</cfloop>
	</ul>
</cfoutput>
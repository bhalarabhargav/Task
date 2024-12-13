// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)
$("#table-body").html("<%= j render 'demo1s/table_rows', demo1s: @demo1s %>");
$(".pagination").html("<%= j paginate @demo1s %>");
$('#table-container').html('<%= j(render partial: "table", locals: { demo1s: @demo1s }) %>');

<script type="text/javascript">
    if (!window.jBPMFormAPI) window.jBPMFormAPI = new jBPMFormsAPI();

    var hostURL = "http://192.168.56.101:8080/business-central";

    var processes = new Object();

/*    processes["HR"] = {
        deploymentId: "org.jbpm:HR:1.0",
        processId: "hiring"
    }; */
    
    processes["loanProcess"] = {
        deploymentId: "com.banking.app:BankingApp:1.0",
        processId: "LoanProcess"
    };
    
    processes["human-resources"] = {
        deploymentId: "org.jbpm:human-resources:1.0",
        processId: "hiring"
    };

  /*  function onsuccessShowForm(response) {
        $("#startProcessDiv").show();
        $("#startProcessAction").show();
        alert("onsuccessShowForm called!");
    }

    function onerrorShowForm(response) {
        alert("Something wrong happened: " + response);
        $("#startProcessDiv").hide();
        $("#startProcessAction").hide();
        jBPMFormAPI.clearContainer("startProcessDiv")
    } */

    function showStartProcessForm() {
        var process = document.getElementById("process").value;
        //alert("process: " + process);
        if (process) {
            var processInfo = processes[process];
            //alert("processInfo: " + processInfo);
            if (processInfo) {
            	alert("processInfo.deploymentId: " + processInfo.deploymentId + ", processInfo.processId:" + processInfo.processId);
                jBPMFormAPI.showStartProcessForm(hostURL, processInfo.deploymentId, processInfo.processId, "startProcessDiv", onsuccessShowForm, onerrorShowForm)
            }
        }
    }

    function onsuccessShowForm(response) {
        $("#startProcessDiv").show();
        $("#startProcessAction").show();
        alert("onsuccessShowForm called, show start process button");
    }

    function onerrorShowForm(response) {
        alert("Something wrong happened: " + response);
        $("#startProcessDiv").hide();
        $("#startProcessAction").hide();
        jBPMFormAPI.clearContainer("startProcessDiv");
    }

    function startProcess() {
        var onsuccess= function(msg) {
            alert(msg);
            $("#startProcessDiv").hide();
            $("#startProcessAction").hide();
            jBPMFormAPI.clearContainer("startProcessDiv");
        }

        var onerror = function(msg) {
            alert(msg);
            $("#startProcessDiv").hide();
            $("#startProcessAction").hide();
            jBPMFormAPI.clearContainer("startProcessDiv");
        }
        jBPMFormAPI.startProcess("startProcessDiv", onsuccess, onerror);
    }
</script>
<div>
    <form class="navbar-form pull-left">
        <select name="process" id="process">
            <option value="loanProcess" selected>LoanProcess</option>
            <!-- <option value="HR" selected>HR</option>  -->
            <option value="human-resources">Human Resources</option>
        </select>
        <input type="button" class="btn" value="Show Start Form" onclick="showStartProcessForm()">
    </form>
    <div id="startProcessDiv" style="display: none; max-height: 300px; max-width: 800px;"></div>
    <br>
    <br>
    <br>
    <br>
    <div id="startProcessAction" style="display: none;">
        <input type="button" class="btn" value="Start Process" onclick="startProcess()">
    </div>
</div>
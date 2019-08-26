<?php
	displayMethodInputs($_GET, "get", true);
	displayMethodInputs($_POST, "post");
	
	function displayMethodInputs($method, $type, $addBreakline = false) {
		$size = sizeof($method);
		
		if ($size == 0) echo "<b>$type</b> { }";
		else {
			echo "<b>$type</b> ($size entr" . ($size > 1 ? "ies" : "y") . ") {<br />";
			foreach ($method as $key => $value)
			echo '&nbsp;&nbsp;&nbsp;&nbsp;<i>' . $key . '</i>: "' . $value . '"<br />';
			echo "}";
		}
		
		if ($addBreakline) echo '<br />';
	}

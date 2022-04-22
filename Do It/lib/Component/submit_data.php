<?php




$con = mysqli_connect("localhost", "root", "", "doit");

        // Check connection
        if ($con === false) {
            die("ERROR: Could not connect. "
                . mysqli_connect_error());
        }
 
// Storing the received JSON in $json.
$json = file_get_contents('php://input');
 
// Decode the received JSON and store into $obj
$obj = json_decode($json,true);
 
// Getting name from $obj.
$goal = $obj['goal_name'];
 
// Getting email from $obj.
$description = $obj['goal_description'];
 

 
// Creating SQL query and insert the record into MySQL database table.
$Sql_Query = "insert into new_goal (goal_name, goal_description) values ('$goal_name','$goal_description')";
 
 
 if(mysqli_query($con,$Sql_Query)){
 
	 // On query success it will print below message.
	$MSG = 'Data Successfully Submitted.' ;
	 
	// Converting the message into JSON format.
	$json = json_encode($MSG);
	 
	// Echo the message.
	 echo $json ;
 
 }
 else{
 
	echo 'Try Again';
 
 }
 mysqli_close($con);
?>
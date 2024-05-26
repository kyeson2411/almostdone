<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}

include 'db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['username']) && isset($_POST['credits'])) {
    $username = $_POST['username'];
    $credits = floatval($_POST['credits']);
    $user->addCredits($username, $credits);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Credits</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">Add Credits</h2>
        <form action="" method="POST" class="form-inline mb-4">
            <div class="form-group mr-2">
                <label for="username" class="mr-2">Username:</label>
                <input type="text" id="username" name="username" class="form-control" required>
            </div>
            <div class="form-group mr-2">
                <label for="credits" class="mr-2">Credits:</label>
                <input type="number" step="0.01" id="credits" name="credits" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Credits</button>
        </form>

        <a href="index.php" class="btn btn-secondary">Back to Main Page</a>
        <a href="logout.php" class="btn btn-danger">Logout</a>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

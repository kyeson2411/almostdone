<?php
session_start();
if (!isset($_SESSION['username']) || $_SESSION['is_admin']) {
    header("Location: login.php");
    exit();
}

include 'db.php';

$username = $_SESSION['username'];
$userInfo = $user->getUserInfo($username);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Account</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">User Account</h2>
        <button id="viewAccountDetails" class="btn btn-primary mb-3">View Account Details</button>
        <button id="orderFood" class="btn btn-success mb-3">Order Food</button>

        <div id="accountDetails" style="display: none;">
            <h4>Account Details</h4>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Username</th>
                        <th>Credits</th>
                        <th>Expires At</th>
                        <th>Time Remaining</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $expires_at = strtotime($userInfo['expires_at']);
                    $remaining_time = $expires_at - time();
                    $time_remaining = $remaining_time > 0 ? gmdate("H:i:s", $remaining_time) : "Expired";
                    ?>
                    <tr>
                        <td><?php echo htmlspecialchars($userInfo['username']); ?></td>
                        <td><?php echo htmlspecialchars($userInfo['credits']); ?></td>
                        <td><?php echo htmlspecialchars($userInfo['expires_at']); ?></td>
                        <td><?php echo $time_remaining; ?></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div id="orderFoodForm" style="display: none;">
            <h4>Order Food</h4>
            <form id="foodOrderForm" method="POST">
                <div class="form-group">
                    <label for="foodItem">Food Item:</label>
                    <input type="text" id="foodItem" name="foodItem" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="foodCost">Cost:</label>
                    <input type="number" step="0.01" id="foodCost" name="foodCost" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-success">Order</button>
            </form>
            <div id="orderResult" class="mt-3"></div>
        </div>

        <a href="logout.php" class="btn btn-danger mt-3">Logout</a>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#viewAccountDetails').on('click', function() {
                $('#accountDetails').toggle();
            });

            $('#orderFood').on('click', function() {
                $('#orderFoodForm').toggle();
            });

            $('#foodOrderForm').on('submit', function(e) {
                e.preventDefault();
                var foodItem = $('#foodItem').val();
                var foodCost = parseFloat($('#foodCost').val());

                $.ajax({
                    url: 'order_food.php',
                    type: 'POST',
                    data: { foodItem: foodItem, foodCost: foodCost },
                    success: function(response) {
                        $('#orderResult').html(response);
                    }
                });
            });
        });
    </script>
</body>
</html>

<?php
session_start();
include 'db.php';

if (!isset($_SESSION['username']) || $_SESSION['is_admin']) {
    echo 'Unauthorized access.';
    exit();
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_SESSION['username'];
    $foodItem = $_POST['foodItem'];
    $foodCost = floatval($_POST['foodCost']);

    $stmt = $conn->prepare("SELECT credits FROM users WHERE username = ?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();
    $user = $result->fetch_assoc();
    $stmt->close();

    if ($user['credits'] >= $foodCost) {
        $stmt = $conn->prepare("UPDATE users SET credits = credits - ? WHERE username = ?");
        $stmt->bind_param("ds", $foodCost, $username);
        $stmt->execute();
        $stmt->close();

        echo "Order placed for $foodItem. Remaining credits: " . ($user['credits'] - $foodCost);
    } else {
        echo "Insufficient credits to place the order.";
    }
}
?>

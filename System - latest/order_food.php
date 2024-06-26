<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}

include 'db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_SESSION['username'];
    $foodItemId = intval($_POST['foodItemId']);

    $userInfo = $user->getUserInfo($username);
    $userId = $userInfo['id'];
    $credits = $userInfo['credits'];

    $stmt = $conn->prepare("SELECT price FROM food_items WHERE id = ?");
    $stmt->bind_param("i", $foodItemId);
    $stmt->execute();
    $stmt->bind_result($price);
    $stmt->fetch();
    $stmt->close();

    if ($credits >= $price) {
        $conn->begin_transaction();

        try {
            $stmt = $conn->prepare("INSERT INTO orders (user_id, food_item_id) VALUES (?, ?)");
            $stmt->bind_param("ii", $userId, $foodItemId);
            $stmt->execute();

            $stmt = $conn->prepare("UPDATE users SET credits = credits - ? WHERE id = ?");
            $stmt->bind_param("di", $price, $userId);
            $stmt->execute();

            $operation = 'deduct';
            $stmt = $conn->prepare("INSERT INTO credit_history (user_id, credits, operation) VALUES (?, ?, ?)");
            $stmt->bind_param("ids", $userId, $price, $operation);
            $stmt->execute();

            $conn->commit();

            echo "Food ordered successfully.";
        } catch (Exception $e) {
            $conn->rollback();
            echo "Error ordering food.";
        }
    } else {
        echo "Insufficient credits.";
    }
}
?>

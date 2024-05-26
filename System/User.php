<?php
class User {
    private $conn;

    public function __construct($db) {
        $this->conn = $db;
    }

    public function addCredits($username, $credits) {
        $minutes = $credits * 6;
        $expires_at = date('Y-m-d H:i:s', strtotime("+$minutes minutes"));

        $stmt = $this->conn->prepare("SELECT * FROM users WHERE username = ?");
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $stmt = $this->conn->prepare("UPDATE users SET credits = credits + ?, expires_at = ? WHERE username = ?");
            $stmt->bind_param("dss", $credits, $expires_at, $username);
        } else {
            $stmt = $this->conn->prepare("INSERT INTO users (username, credits, expires_at) VALUES (?, ?, ?)");
            $stmt->bind_param("sds", $username, $credits, $expires_at);
        }

        $stmt->execute();
        $stmt->close();
    }

    public function getUserInfo($username) {
        $stmt = $this->conn->prepare("SELECT username, credits, expires_at, is_admin FROM users WHERE username = ?");
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $result = $stmt->get_result();
        $stmt->close();
        return $result->fetch_assoc();
    }

    public function isAdmin($username) {
        $stmt = $this->conn->prepare("SELECT is_admin FROM users WHERE username = ?");
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $result = $stmt->get_result();
        $stmt->close();
        $user = $result->fetch_assoc();
        return $user['is_admin'] == 1;
    }
}
?>

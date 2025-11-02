<?php

// Point d'entrée Laravel simplifié
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');

$uri = $_SERVER['REQUEST_URI'];

if ($uri === '/health') {
    echo json_encode(['status' => 'OK', 'service' => 'biblio-backend']);
} elseif ($uri === '/api/books') {
    echo json_encode([
        'books' => [
            ['id' => 1, 'title' => 'Laravel Guide', 'author' => 'John Doe'],
            ['id' => 2, 'title' => 'Angular Basics', 'author' => 'Jane Smith']
        ]
    ]);
} else {
    echo json_encode(['message' => 'Biblio Pro API', 'version' => '1.0']);
}
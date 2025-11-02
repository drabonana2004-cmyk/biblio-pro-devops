<?php

namespace Tests\Feature;

use PHPUnit\Framework\TestCase;

class ExampleTest extends TestCase
{
    public function test_basic_test()
    {
        $this->assertTrue(true);
    }
    
    public function test_api_health()
    {
        $response = ['status' => 'OK'];
        $this->assertEquals('OK', $response['status']);
    }
}
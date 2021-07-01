<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class BetaTest extends TestCase
{
    /**
     * A basic feature test example.
     *
     * @return void
     */
    public function testExample()
    {
      $response = $this->get('/beta');

      $response->assertStatus(200);

      $response->assertSee('Beta');
      $response->assertDontSee('Alpha');
    }
}

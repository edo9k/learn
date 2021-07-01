<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

# import our example class
use App\Box;

class BasicTest extends TestCase
{
  public function testBoxContents() {
    $box = new Box(['toy']);
    $this->assertTrue($box->has('toy'));
    $this->assertFalse($box->has('ball'));
  }

  public function testTakeOneFromTheBox() {
    $box = new Box(['torch']);
    $this->assertEquals('torch', $box->takeOne());

    // assert the box is empty
    $this->assertNull($box->takeOne());
  }

  public function testStartsWithALetter() {
    $box = new Box(['toy', 'torch', 'ball', 'cat', 'tissue']);

    $results = $box->startsWith('t');

    $this->assertCount( 3,  $results);
    $this->assertContains('toy',    $results);
    $this->assertContains('torch',  $results);
    $this->assertContains('tissue', $results);

    $this->assertEmpty($box->startsWith('s'));
  }


}

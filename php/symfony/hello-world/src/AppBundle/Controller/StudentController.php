<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class StudentController {
  /**
   * @Route("/student/home")
   */
  public function homeAction() {
    return new Response('Student details and stuff.');
  }  
}

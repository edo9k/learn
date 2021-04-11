<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class StudentController extends Controller {
  /**
   * @Route("/student/home")
   */
  public function homeAction() {
    return $this->render('/student/home.html.twig');
  }  
}


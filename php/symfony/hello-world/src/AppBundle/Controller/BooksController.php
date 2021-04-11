<?php 

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkExtraBundle\Controller\Controller;
use Symfony\Component\HttpFoundationo\Response;

class BooksController {
  /**
   * @Route("/books/author")
   */
  public function authorAction() {
    //return new Response('TODO: Book author route');
    return $this->render('book/author.html.twig');
  }
}


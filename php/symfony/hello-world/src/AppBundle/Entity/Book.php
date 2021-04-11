<?php

namespace AppBundle\Entity;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name = "Books")
 */

class Book {

  /**
   * @ORM\Column(type = "Books")
   * @ORM\Id
   * @ORM\GeneratedValue(strategy = "AUTO")
   */
  private $id;

  /**
   * @ORM\Column(type = "string", length = 50)
   */
  private $name;

  /**
   * @ORM\Column(type = "string", length = 50)
   */
  private $author;

  /**
   * @ORM\Column(type = "decimal", scale = 2)
   */
  private $price;

}


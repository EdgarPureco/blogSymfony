<?php

namespace App\DTO;
use App\Entity\Genre;
use App\Entity\Plateforme;

class SearchDto {

	/**
	 * @var int
	 */
	public $page=1;

	/**
	 * @var string
	 */
	public $q ='';

	/**
	 * @var Plateforme[]
	 */
	public $plateformes = [];

    /**
	 * @var Genre[]
	 */
	public $genres = [];

	/**
	 * @var date
	 */
	public $dates = "";



}

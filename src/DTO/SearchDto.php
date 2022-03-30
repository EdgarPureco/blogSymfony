<?php

namespace App\DTO;
use App\Entity\Genre;
use App\Entity\Plateforme;

class SearchDto {

	
	public string $q ='';

	/**
	 * @var Plateforme[]
	 */
	public $plateformes = [];

    /**
	 * @var Genre[]
	 */
	public $genres = [];
}

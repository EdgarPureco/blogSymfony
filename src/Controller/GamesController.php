<?php

namespace App\Controller;

use App\Entity\Games;
use App\Repository\GamesRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route("/games")]

class GamesController extends AbstractController
{

    private GamesRepository $gamesRepository;


    public function __construct(GamesRepository $gamesRepository) {
		$this->gamesRepository = $gamesRepository;
	}


    #[Route("/", name: "games_index", methods: ["GET"])]
    public function index(): Response
    {
        return $this->render('games/index.html.twig', [
            'games' => $this->gamesRepository->findAll()
        ]);
    }

   

    #[Route("/genre", name: "games_genre", methods: ["GET"])]
	public function getByGenre(): Response {
		return $this->render('games/index.html.twig', [
            'games' => $this->gamesRepository->findByGenre("FPS")
        ]);
	}

    #[Route("/plateforme", name: "games_plateforme", methods: ["GET"])]
	public function getByPlateforme(): Response {
		return $this->render('games/index.html.twig', [
            'games' => $this->gamesRepository->findByPLateforme("PS5")
        ]);
	}


    #[Route("/{id}", name: "games_get", methods: ["GET"])]
	public function getById(Games $game): Response {
		return $this->render('games/get.html.twig', [
			'game' => $game
		]);
	}






}

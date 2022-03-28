<?php

namespace App\Controller;
use App\Repository\GamesRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class GamesController extends AbstractController
{

    public function __construct(GamesRepository $gamesRepository) {
		$this->gamesRepository = $gamesRepository;
	}

    #[Route('/games', name: 'app_games')]
    public function index(): Response
    {
        return $this->render('games/index.html.twig', [
            'controller_name' => 'GamesController',
            'games' => $this->gamesRepository->findAll()
        ]);
    }
}

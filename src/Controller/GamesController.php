<?php

namespace App\Controller;

use App\DTO\SearchDto;
use App\Form\SearchForm;
use App\Entity\Games;
use App\Entity\Plateforme;
use App\Entity\Genre;
use App\Repository\GamesRepository;
use Symfony\Component\HttpFoundation\Request;
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
    public function index(Request $request): Response
    {
        $data = new SearchDto();
        $data->page = $request->get('page',1);
        $form  = $this->createForm(SearchForm::class, $data);
        $form->handleRequest($request);
        $games = $this->gamesRepository->findsearch($data);
        return $this->render('games/index.html.twig', [
            'games' => $games,
            'form' =>$form->createView(),
        ]);
    }

    #[Route("/genre/{genre}", name: "games_genre", methods: ["GET"])]
	public function getByGenre(Int $genre): Response {
		return $this->render('games/index.html.twig', [
            'games' => $this->gamesRepository->findByGenre($genre)
        ]);
	}

    #[Route("/plateforme/{plateforme}", name: "games_plateforme", methods: ["GET"])]
	public function getByPlateforme(Int $plateforme): Response {
		return $this->render('games/index.html.twig', [
            'games' => $this->gamesRepository->findByPLateforme($plateforme)
        ]);
	}

    #[Route("/oldTonew", name: "games_old", methods: ["GET"])]
	public function getbyold(): Response {
		return $this->render('games/index.html.twig', [
            'games' => $this->gamesRepository->findNewToOld()
        ]);
	}

    #[Route("/newToold", name: "games_new", methods: ["GET"])]
	public function getbynew(): Response {
		return $this->render('games/index.html.twig', [
            'games' => $this->gamesRepository->findOldtoNew()
        ]);
	}

    #[Route("/id/{id}", name: "games_get", methods: ["GET"])]
	public function getById(Games $game): Response {
		return $this->render('games/get.html.twig', [
			'game' => $game
		]);
	}


   







}



<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\ArticleRepository;

#[Route("/article")]
class ArticleController extends AbstractController
{
    private ArticleRepository $articlesRepository;


    public function __construct(ArticleRepository $articlesRepository) {
		$this->articlesRepository = $articlesRepository;
	}


    #[Route('/', name: 'app_article', methods: ["GET"])]
    public function index(): Response
    {
        return $this->render('article/index.html.twig', [
            'articles' => $this->articlesRepository->findAll()
        ]);
    }
}

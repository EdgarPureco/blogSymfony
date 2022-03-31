<?php

namespace App\Controller;

use App\Entity\Article;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\ArticleRepository;
use App\Entity\Commentaire;
use App\Form\CommentaireType;
use Symfony\Component\HttpFoundation\Request;

#[Route("/article")]
class ArticleController extends AbstractController
{
    private ArticleRepository $articlesRepository;


    public function __construct(ArticleRepository $articlesRepository) {
		$this->articlesRepository = $articlesRepository;
	}


    #[Route('/', name: 'article_index', methods: ["GET"])]
    public function index(): Response
    {
        return $this->render('article/index.html.twig', [
            'articles' => $this->articlesRepository->findAll(),
        ]);
    }

    #[Route("/id/{id}", name: "article_get", methods: ["GET"])]
	public function getById(Article $article, Request $request): Response {
        $commentaire = new Commentaire;
        $commentForm  = $this->createForm(CommentaireType::class, $commentaire);
        $commentForm->handleRequest($request);

		return $this->render('article/get.html.twig', [
			'article' => $article,
            'commentForm' =>$commentForm->createView()

		]);
	}
}
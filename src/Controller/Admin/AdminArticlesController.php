<?php

namespace App\Controller\Admin;

use App\DTO\ArticleDto;
use App\Entity\Article;
use App\Form\ArticleType;
use App\Services\ArticleService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route("/admin/articles")]
class AdminArticlesController extends AbstractController
{
	private ArticleService $articleService;

	public function __construct(ArticleService $articleService) {
		$this->articleService = $articleService;
	}

    #[Route("/add", name: "admin_articles_add", methods: ["GET", "POST"])]
    public function add(Request $request): Response
    {
	    $articletDto = new ArticleDto();

	    $form = $this->createForm(ArticleType::class, $articletDto);
	    $form->handleRequest($request);
		/**
	 	* @param User $user
	 	*/
		 //dd($request);
	    if ($form->isSubmitted() && $form->isValid()) {
	    	$article = new Article();
		    $this->articleService->addOrUpdate($articletDto, $article);

		    $this->addFlash('success', 'Article ajoutée !');
			
		    return $this->redirectToRoute('article_get', [
			    'id' => $article->getId()
		    ]);
	    }

	    return $this->render('admin/articles/edit.html.twig', [
		    'form' => $form->createView(),
		    'isAdd' => true
	    ]);
    }

    #[Route("/{id}/edit", name: "admin_articles_edit", methods: ["GET", "POST"])]
    public function edit(Request $request, Article $article): Response
    {
	    $articleDto = new ArticleDto();

	    $articleDto->setFromEntity($article);

	    $form = $this->createForm(ArticleType::class, $articleDto);
	    $form->handleRequest($request);

	    if ($form->isSubmitted() && $form->isValid()) {
		    $this->articleService->addOrUpdate($articleDto, $article);

		    $this->addFlash('success', 'Catégorie modifiée !');

		    return $this->redirectToRoute('articles_get_products', [
			    'id' => $article->getId()
		    ]);
	    }

	    return $this->render('admin/articles/edit.html.twig', [
		    'form' => $form->createView(),
		    'isAdd' => false,
		    'article' => $article
	    ]);
    }

    #[Route("/{id}", name: "admin_articles_delete", methods: ["GET"])]
    public function delete(Article $article): Response
    {
	    $this->articleService->delete($article);

	    $this->addFlash('success', 'Catégorie supprimée !');

	    return $this->redirectToRoute('index');
    }
}

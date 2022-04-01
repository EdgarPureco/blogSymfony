<?php

namespace App\Controller;

use App\Entity\Article;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\ArticleRepository;
use App\Entity\Commentaire;
use App\Form\CommentaireType;
use DateTimeImmutable;
use Doctrine\Persistence\ManagerRegistry;

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

    #[Route("/id/{id}", name: "article_get", methods: ["GET", "POST"])]
	public function getById(Article $article, Request $request, ManagerRegistry $doctrine): Response {
        $commentaire = new Commentaire;
        $commentForm  = $this->createForm(CommentaireType::class, $commentaire);
        $commentForm->handleRequest($request);
        if ($commentForm->isSubmitted() && $commentForm->isValid()){
            $commentaire->setCreatedAt(new DateTimeImmutable());
            $commentaire->setArticle($article);
            //on recupere le parentid, qui n'est pas ajouter en base automatiquement car en mapped false
            $parentid = $commentForm->get("parentid")->getData();
            $commentaire->setUser($this->getUser());
            $entityManager = $doctrine->getManager();
            //on recupére le parent associé, peut etre vide si le commentaire n'est pas une réponse
            if($parentid != null){
                $parent = $entityManager->getRepository(Commentaire::class)->find($parentid);
            }
            $commentaire->setParent($parent ?? null);
            $entityManager->persist($commentaire);
            $entityManager->flush();
            $this->addFlash('message', 'Votre commentaire a bien été envoyé');
        }
		return $this->render('article/get.html.twig', [
			'article' => $article,
            'commentForm' =>$commentForm->createView()

		]);
	}
}
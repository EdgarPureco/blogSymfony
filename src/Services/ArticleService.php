<?php

namespace App\Services;

use App\DTO\AbstractDto;
use App\DTO\ArticleDto;
use App\Entity\AbstractEntity;
use App\Entity\Article;
use App\Repository\ArticleRepository;
use DateTime;
use Symfony\Component\Config\Definition\Exception\Exception;
use Symfony\Component\PasswordHasher\Hasher\ArticlePasswordHasherInterface;
use Symfony\Component\Security\Core\Article\PasswordAuthenticatedArticleInterface;

class ArticleService extends AbstractEntityService {

	public function __construct(ArticleRepository $userRepository) {
		parent::__construct($userRepository);
	}

	/**
	 * @param ArticleDto $dto
	 * @param Article $entity
	 */
	public function addOrUpdate(AbstractDto $dto, AbstractEntity $entity): void {
		
		parent::addOrUpdate($dto, $entity);
	}
}

<?php

namespace App\DTO;

use App\Entity\AbstractEntity;
use App\Entity\Article;
use App\Entity\Category;
use Symfony\Component\Validator\Constraints as Assert;

class ArticleDto extends AbstractDto {

	#[Assert\NotBlank]
	#[Assert\Length(max: 250)]
	public string $title;

	#[Assert\NotBlank]
	public string $text;

	#[Assert\NotBlank]
	#[Assert\Length(max: 250)]
	public DateTime $created;

	#[Assert\NotBlank]
	#[Assert\Length(max: 250)]
	public string $user;

	#[Required]
	public Category $category;

	/**
	 * @param Article $article
	 */
	public function setFromEntity(AbstractEntity $article): void {
		//$this->id = $article->getId();
		$this->title = $article->getTitle();
		$this->text = $article->getText();
		$this->created = $article->getCreated();
		$this->user = $article->getUser();
		$this->category = $article->getCategory();
	}
}

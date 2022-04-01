<?php

namespace App\Form;

use App\DTO\ArticleDto;
use App\Entity\Article;
use App\Entity\Category;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

class ArticleType extends AbstractType
{
    private EntityManagerInterface $entityManager;

	public function __construct(EntityManagerInterface $entityManager)
	{
		$this->entityManager = $entityManager;
	}

    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('title', TextType::class)
            ->add('text',TextareaType::class)
            ->add('category', EntityType::class, [
				'class' => Category::class,
				'choices' => $this->entityManager->getRepository(Category::class)->findAll(),
				'choice_label' => 'name',
				'attr' => ['class' => 'email']
			])
        ;
    }

    public function configureOptions(OptionsResolver $resolver) {
		$resolver->setDefaults([
			'data_class' => ArticleDto::class,
			'required' => false
		]);
	}
}

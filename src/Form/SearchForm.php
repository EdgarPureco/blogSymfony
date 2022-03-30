<?php

namespace App\Form;

use App\Entity\Plateforme;
use App\Entity\Genre;
use App\DTO\SearchDto;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class SearchForm extends AbstractType
{

    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('q', TextType::class, [
                'label' => false,
                'required' => false,
                'attr' => [
                    'placeholder' => 'Rechercher'
                ]
            ])
            ->add('plateformes', EntityType::class, [
                'label' => false,
                'required' => false,
                'class' => Plateforme::class,
                'expanded' => true,
                'multiple' => true,         
            ])

            ->add('genres', EntityType::class, [
                'label' => false,
                'required' => false,
                'class' => Genre::class,
                'expanded' => true,
                'multiple' => true,         
            ])

            ;
    } 

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => SearchDto::class,
            'csrf_protection' => false,
            'method' => 'GET',
        ]);
    }

    public function getBlockPrefix()
    {
        return '';
    }





}

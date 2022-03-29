<?php

namespace App\Form;

use App\DTO\UserDto;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class UserType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
	        ->add('mail', EmailType::class, [
		        'attr' => ['class' => 'email','placeholder' => 'email'],
                
	        ])
            ->add('password', PasswordType::class, [
	            'attr' => ['class' => 'email','placeholder' => 'email'],
                
            ])
            ->add('passwordConfirm', PasswordType::class, [
	            'attr' => ['class' => 'email','placeholder' => 'email'],
                
            ])
            ->add('name', TextType::class, [
	            'attr' => ['class' => 'email','placeholder' => 'email'],
                
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => UserDto::class,
            'required' => false
        ]);
    }
}

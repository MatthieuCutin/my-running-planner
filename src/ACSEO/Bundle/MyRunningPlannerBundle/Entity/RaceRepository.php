<?php

namespace ACSEO\Bundle\MyRunningPlannerBundle\Entity;

use Doctrine\ORM\EntityRepository;

/**
 * RaceRepository.
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class RaceRepository extends EntityRepository
{
    public function getNextRace($date)
    {
        $qb = $this->createQueryBuilder('r')
            ->where('r.date > :date')
            ->orderBy('r.date', 'ASC')
            ->setParameter('date', $date)
            ->setMaxResults(1);

        return $qb->getQuery()->getOneOrNullResult();
    }
}
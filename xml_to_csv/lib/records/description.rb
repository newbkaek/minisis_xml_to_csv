class Description
  include SAXMachine

  @@maps = {
    radGeneralMaterialDesignation: %i[_radGeneralMaterialDesignation1 _radGeneralMaterialDesignation2 _radGeneralMaterialDesignation3],
    subjectAccessPoints: %i[_subjectAccessPoints1 _subjectAccessPoints2],
    creatorDates: %i[_creatorDates1 _creatorDates2],
    archivistNote: %i[_archivistNote1 _archivistNote2],
    nameAccessPoints: %i[_nameAccessPoints1 _nameAccessPoints2 _nameAccessPoints3 _nameAccessPoints4],
    radNoteGeneral: %i[_radNoteGeneral1 _radNoteGeneral2 _radNoteGeneral3 _radNoteGeneral4 _radNoteGeneral5 _radNoteGeneral6],
    physicalCharacteristics: %i[_physicalCharacteristics1 _physicalCharacteristics2],
    language: %i[_language1 _language2],
    radTitleAttributionsAndConjectures: %i[_radTitleAttributionsAndConjectures1 _radTitleAttributionsAndConjectures2],
    relatedUnitsOfDescription: %i[_relatedUnitsOfDescription1 _relatedUnitsOfDescription2],
    alternativeIdentifiers: %i[_alternativeIdentifiers1 _alternativeIdentifiers2 _alternativeIdentifiers3 _alternativeIdentifiers4]
  }
  
  # overload class method
  def self.column_names
    super - @@maps.values.flatten + @@maps.keys
  end

  element :ACCESSION_GRP,     as: :accessionNumber # FIXME: use sub-element: D_ACCNO
  element :REFD,              as: :legacyId
  element :REFD,              as: :identifier
  element :TITLE,             as: :title
  element :LEVEL_DESC,        as: :levelOfDescription
  element :WEBD,              as: :publicationStatus
  element :REFD_HIGHER,       as: :parentId
  element :PHYSICAL_DESC,     as: :extentAndMedium
  element :RESTRICTIONS,      as: :accessConditions
  element :SCOPE,             as: :scopeAndContent
  # NB: this will take the value from all sub-elements, eg. ORGANIZATION | INDIVIDUAL
  element :ORIGINATION_GRP,   as: :creators # FIXME: pipe-delimited
  element :COPYRIGHT_NOTE,    as: :radNoteRights
  element :AVAILABILITY,      as: :locationOfCopies # FIXME: use sub-element: OTHER_FORMATS
  element :LOC_GEOG,          as: :placeAccessPoints
  element :SIGNATURES,        as: :radNoteSignatures
  element :TERMS_GOV_USE,     as: :reproductionConditions
  element :CUSTODIAL_HIST,    as: :archivalHistory
  element :PARALLEL_TITLE,    as: :alternateTitle
  element :STATEMENT_RESP,    as: :radTitleStatementOfResponsibility
  element :IMM_SOURCE_ACQ,    as: :acquisition
  element :PUBLISHER_SERIES,  as: :radPublishersSeriesNote
  element :PUBLISHER_SERIES,  as: :radNoteOnPublishersSeries
  element :ACCOMPANYING_MAT,  as: :radNoteAccompanyingMaterial
  element :ARRANGEMENT,       as: :arrangement
  element :PHYS_DESC_NOTES,   as: :radNotePhysicalDescription
  element :ACCRUALS_NOTES,    as: :accruals
  element :EDITION,           as: :radEdition
  element :LANGUAGE_NOTES,    as: :languageNote
  element :FINDAID_GRP,       as: :findingAids # FIXME: use sub-element: FINDAID
  element :LOC_OF_ORIGINAL,   as: :locationOfOriginals
  element :CONSERVATION,      as: :radNoteConservation

  element :DATE_CR_INC,       as: :_creatorDates1
  element :DATE_CR_PRED,      as: :_creatorDates2

  def creatorDates(concat = '|')
    @@maps[:creatorDates].map {|s| send(s)}.compact.join(concat)
  end

  element :NOTES,             as: :_radNoteGeneral1
  element :REFERENCE_REF,     as: :_radNoteGeneral2
  element :CREDITS,           as: :_radNoteGeneral3
  element :MODE_OR_PROCESS,   as: :_radNoteGeneral4
  element :TECHNICAL_SPEC,    as: :_radNoteGeneral5
  element :SOUND_CHAR,        as: :_radNoteGeneral6

  def radNoteGeneral(concat = '|')
    @@maps[:radNoteGeneral].map {|s| send(s)}.compact.join(concat)
  end

  element :PHYSICAL_COND,     as: :_physicalCharacteristics1
  element :CONDITION_NOTES,   as: :_physicalCharacteristics2
  
  def physicalCharacteristics(concat = '|')
    @@maps[:physicalCharacteristics].map {|s| send(s)}.compact.join(concat)
  end

  element :LANGUAGE_MAT,      as: :_language1
  element :LANGUAGE,          as: :_language2

  def language(concat = '|')
    @@maps[:language].map {|s| send(s)}.compact.join(concat)
  end

  element :TITLE_NOTES,       as: :_radTitleAttributionsAndConjectures1
  element :ATTRIBUTIONS,      as: :_radTitleAttributionsAndConjectures2

  def radTitleAttributionsAndConjectures(concat = '|')
    @@maps[:radTitleAttributionsAndConjectures].map {|s| send(s)}.compact.join(concat)
  end

  element :RELATED_MAT,       as: :_relatedUnitsOfDescription1
  element :ASSOCIATED_MAT,    as: :_relatedUnitsOfDescription2

  def relatedUnitsOfDescription(concat = '|')
    @@maps[:relatedUnitsOfDescription].map {|s| send(s)}.compact.join(concat)
  end

  element :STANDARD_NUMBER,   as: :_alternativeIdentifiers1
  element :ISBN,              as: :_alternativeIdentifiers2
  element :OTHER_CODES,       as: :_alternativeIdentifiers3
  element :AV_NUMBER,         as: :_alternativeIdentifiers4

  def alternativeIdentifiers(concat = '|')
    @@maps[:alternativeIdentifiers].map {|s| send(s)}.compact.join(concat)
  end

  element :SUBJECT,           as: :_subjectAccessPoints1
  element :INDEXSUB,          as: :_subjectAccessPoints2

  def subjectAccessPoints(concat = '|')
    @@maps[:subjectAccessPoints].map {|s| send(s)}.compact.join(concat)
  end

  element :INDEXPROV,         as: :_nameAccessPoints1
  element :ARCHITECT,         as: :_nameAccessPoints2
  element :PUBLISHER,         as: :_nameAccessPoints3
  element :OTHERS_RESP,       as: :_nameAccessPoints4

  def nameAccessPoints(concat = '|')
    @@maps[:nameAccessPoints].map {|s| send(s)}.compact.join(concat)
  end

  element :MEDIUM,            as: :_radGeneralMaterialDesignation1
  element :SMD,               as: :_radGeneralMaterialDesignation2
  element :FORM,              as: :_radGeneralMaterialDesignation3

  def radGeneralMaterialDesignation(concat = '|')
    @@maps[:radGeneralMaterialDesignation].map {|s| send(s)}.compact.join(concat)
  end

  element :BOX_NO,            as: :_archivistNote1
  element :COMMENTS_DESC,     as: :_archivistNote2

  def archivistNote(concat = '|')
    @@maps[:archivistNote].map {|s| send(s)}.compact.join(concat)
  end
end
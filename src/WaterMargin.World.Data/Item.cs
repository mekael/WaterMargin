using System;
using System.Collections.Generic;
using System.Text;

namespace WaterMargin.World.Data
{
    public class Item
    {
        public int Id { get; set; }
        public int ClassId { get; set; }
        public int Open { get; set; }
        public int CanDepositWarehouse { get; set; }
        public int CanDestroy { get; set; }
        public int CanSell { get; set; }
        public int NonTradable_After_EQ_or_Use { get; set; }
        public string ReferenceTradingPvPDropStatus { get; set; }
        public int CanTrade { get; set; }
        public int CanDropByPK { get; set; }
        public string Name { get; set; }
        public int StrengthReferenceLevel { get; set; }
        public string ReferenceCharacterUsed { get; set; }
        public string ReferenceItemType { get; set; }
        public string ReferenceItemRarityLevel { get; set; }
        public int RareDegree { get; set; }
        public string ReferenceItemOrigin { get; set; }
        public int SubClassId { get; set; }
        public int SubClassPresetId { get; set; }
        public int NameStringId { get; set; }
        public int DescStringId { get; set; }
        public int HistoryStringId { get; set; }
        public int GfxId { get; set; }
        public string TemplateName3d { get; set; }
        public int MaxHeap { get; set; }
        public int LevelLimit { get; set; }
        public int CharLimit { get; set; }
        public int RankLimit { get; set; }
        public string ReferenceGuildPositionRestriction { get; set; }
        public int GuildMemberTitleLimit { get; set; }
        public int GuildLevelLimit { get; set; }
        public string ReferenceSpecialCategoryItems { get; set; }
        public int ItemListKind { get; set; }
        public string ReferenceEnhancementScrollAffectedParts { get; set; }
        public int EnchantItemKind { get; set; }
        public int EnchantInsurance { get; set; }
        public int EnchantCursed { get; set; }
        public int EnchantCatalyzerFactor { get; set; }
        public int ShoppingPrice { get; set; }
        public int SellingPrice { get; set; }
        public int SortId { get; set; }
        public int Consumed { get; set; }
        public int NotLostExpOnDie { get; set; }
        public int Resurrection { get; set; }
        public int HPRateOnResurrection { get; set; }
        public int MPRateOnResurrection { get; set; }
        public string NoteOnDamageReflectionRate { get; set; }
    }
}
